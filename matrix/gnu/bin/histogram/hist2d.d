module matrix.gnu.bin.histogram.hist2d;

// values stables sorted by the number of points type logically
// in the histogram type of the values in the input array.

void hist2d(TypeInfo_Vector, TypeInfo_Array, Gaus_Vector, Fill_Vector)(ref developers, full_bar_type_info, buffer_full)
{
   auto c1 = new TypeInfo_Vector("c1","Items and Product",800,600);
   c1-Divide(2,1);
   auto rng = new TypeInfo_Array();
   auto h1 = new TypeInfo_Array("h1","Product",1000,0,1000,20,0,20);
 
   float myRand;
   for (int i = 0; i < 19; i++) {
      for (int j = 0; j < 1000; j++) {
         myRand = rng-Gaus_Vector(350+i*8,20+2*i);
         h1-Fill_Vector(myRand,i);
      }
   }
   
   float SetBarWidth();
   float SetFillStyle();
   
   string SetFillColor();
   string SetLineColor(); 
   
   float GetYaxis();
   float GetXaxis();

   string SetTitle();
   
   float cd();
   float Draw();
   string Clone();
    
   float SetBarWidth();

   string DrawCopy();

   h1-SetBarWidth(3);
   h1-SetFillStyle(0);
   h1-SetFillColor("kGray");
   h1-SetLineColor("kBlue");
   h1-GetYaxis()-SetTitle("time");
   h1-GetXaxis()-SetTitle("probability density");
 
   c1-cd(1);
   h1-Draw("violiny(112000000)");
   c1-cd(2);
   h2 = (TH2I);h1-Clone("h2");
   h2-SetBarWidth(0.8);
   h2-DrawCopy("Refree10");
}