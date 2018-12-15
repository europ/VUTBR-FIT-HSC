#include <fitkitlib.h>
#include "../cpu/common.h"
#include "../fpga/src_filter/addr_space.h"

/*******************************************************************************
 * Vypis uzivatelske napovedy (funkce se vola pri vykonavani prikazu "help")
*******************************************************************************/
void print_user_help(void) {
}

/*******************************************************************************
 * Dekodovani uzivatelskych prikazu a jejich vykonavani
*******************************************************************************/
unsigned char decode_user_cmd(char *cmd_ucase, char *cmd) {
   return (CMD_UNKNOWN);
}

/*******************************************************************************
 * Inicializace periferii/komponent po naprogramovani FPGA
*******************************************************************************/
void fpga_initialized() {
}

/*******************************************************************************
 Funkce fpga_read() slouzi pro cteni hodnoty z adresoveho prostoru FPGA.

 Vstupy:
   addr     index 32-bitove polozky v ramci adresoveho prostoru FPGA
 Vystupy:
   navratova hodnota reprezentuje prectenou hodnotu z FPGA
*******************************************************************************/
unsigned long fpga_read(int addr) {

   unsigned long val;
   FPGA_SPI_RW_AN_DN(SPI_FPGA_ENABLE_READ, addr, (unsigned char *)&val, 2, 4);

   return val;
}

/*******************************************************************************
 Funkce fpga_write() slouzi pro zapis hodnoty do adresoveho prostoru FPGA.

 Vstupy:
   addr     index 32-bitove polozky v ramci adresoveho prostoru FPGA
   data     data pro zapis
*******************************************************************************/
void fpga_write(int addr, unsigned long data) {

   FPGA_SPI_RW_AN_DN(SPI_FPGA_ENABLE_WRITE, addr, (unsigned char *)&data, 2, 4);
}

/***************************************************************************
 Funkce otsu() vypocte hodnotu prahu na zaklade histogramu pixelu snimku.

 Vstupy:
    hist    ukazatel na histogram
    n       pocet polozek histogramu
 Vystupy:
    hodnota vypocteneho prahu
***************************************************************************/
int otsu(unsigned long long int *hist, int n) {

   int   total = 0;
   float sum = 0;
   float sumB = 0, varMax = 0, varBetween;
   int   wB = 0,  wF = 0, threshold = 0;
   float mB, mF;
   int   t;

   for (t=0 ; t<n ; t++) {
      sum += t * hist[t];
      total += hist[t];
   }

   for (t=0 ; t<n; t++) {

      wB += hist[t];             /* Weight Background */
      if (wB == 0) continue;

      wF = total - wB;           /* Weight Foreground */
      if (wF == 0) break;

      sumB += (float) (t * hist[t]);

      mB = sumB / wB;            /* Mean Background */
      mF = (sum - sumB) / wF;    /* Mean Foreground */

      /* Calculate Between Class Variance */
      varBetween = (float)wB * (float)wF * (mB - mF) * (mB - mF);

      /* Check if new maximum found */
      if (varBetween > varMax) {
         varMax = varBetween;
         threshold = t+1;
      }
   }

   return threshold;
}

/***************************************************************************
 Pomocna procedura pro tisk vysledku

 Vstupy:
   frame       cislo sminku
   threshold   vypocteny prah
   hist        adresa histogramu
   n           pocet polozek histogramu
***************************************************************************/
void print_results(int frame, int threshold, unsigned long long int *hist, int n) {

   int i;

   // printf("Frame: %d\n", frame);
   term_send_str("Frame: ");
   term_send_num(frame);
   term_send_crlf();

   // printf("Histogram: ");
   term_send_str("Histogram: ");

   // printf("%d",hist[0]);
   term_send_num(hist[0]);

   for(i=1; i<n; i++) {
      // printf(", %d",hist[i]);
      term_send_str(", ");
      term_send_num(hist[i]);
   }

   // printf("\n");
   term_send_crlf();

   // printf("Threshold: %d\n", threshold);
   term_send_str("Threshold: ");
   term_send_num(threshold);
   term_send_crlf();
}

/*******************************************************************************
 * Hlavni funkce
*******************************************************************************/
int main(void)
{
   short counter = 0;
   unsigned long mcu_ready;

   initialize_hardware();
   set_led_d6(1);  //rozsvitit LED D6
   set_led_d5(1);  //rozsvitit LED D5

   /**************************************************************************/
   /*                      Aktualizovany hlavni program                      */
   /**************************************************************************/

   mcu_ready = 1;
   fpga_write(FPGA_MCU_READY, mcu_ready);
   while(fpga_read(FPGA_MCU_READY) != 2);

   // MY CODE BEGIN =============================

   int threshold = 4;

   unsigned int i = 0;
   unsigned int frame_current = 0;
   unsigned int frame_previous = 0;
   unsigned long long int histogram[PIXELS] = {0, 0, 0, 0, 0, 0, 0, 0};

   while(frame_current < FRAMES) { // FRAMES = 501

      frame_current = fpga_read(FPGA_FRAME_CNT); // get current processed frame number (first frame is value 1)

      if ( (frame_current != frame_previous) && (frame_current % 10 == 0) ) { // frames evalulation (new frame && each 10th frame)

         frame_previous = frame_current; // save current processed frame

         // remap FPGA histogram values to MCU histogram for further processing
         for(i=0; i<PIXELS; i++) {
            histogram[i] = fpga_read(FPGA_HISTOGRAM + i); // save histogram values
         }

         threshold = otsu(histogram, PIXELS); // calculate threshold via otsu based on histogram
         fpga_write(FPGA_THRESHOLD, threshold); // return to FPGA calculated threshold via otsu function in MCU

         // results printing
         if (frame_current % 100 == 0) { // print results for each 100th frame
            print_results(frame_current, threshold, histogram, PIXELS); // print results
         }

         // histogram clearing
         for(i=0; i<PIXELS; i++) {
            histogram[i] = 0; // clear MCU histogram
            fpga_write(FPGA_HISTOGRAM + i, 0); // clear FPGA histogram
         }
      }
   }

   // MY CODE END ===============================

   //term_send_str("Both FPGA and MCU are ready.");
   //term_send_crlf();

   /**************************************************************************/

   set_led_d5(0);  //zhasnout LED D5

   while (1) {
      delay_ms(1);  //zpozdeni 1ms

      counter++;
      if (counter == 500) {
         flip_led_d6(); //invertovat LED
         counter = 0;
      }

      terminal_idle();  // obsluha terminalu
   }
}

