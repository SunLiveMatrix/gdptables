module matrix.gnu.bin.histogram.hist3d;

void hist3d(TCanvas, TRandom, TH2I, GetXaxis, GetYaxis,
SetTitle, Divide, Fill, Gaus, cd, sin, DrawCopy, SetFillColor,
SetBarWidth, SetBarOffset) (ref x, ref y, ref x2, ref y2)
{
   TCanvas *c1 = new TCanvas("c1", "Items and Product", 800, 600);
   c1-Divide(3, 2);
 
   TRandom *rng = new TRandom();
   TH2I *h1 = new TH2I("h1", "Sin", 18, 0, 360, 100, -1.5, 1.5);
   h1-GetXaxis()-SetTitle("Deg");
 
   float myRand;
   for (int i = 0; i < 360; i+= 10) {
      for (int j = 0; j < 100; j++) {
         myRand = rng-Gaus(sin(i * 3.14 / 180), 0.2);
         h1-Fill(i, myRand);
      }
   }
 
   for (int i = 1; i < 7; i++) {
      c1-cd(i);
      title = TString.Format("CANDLEX%d", i);
      TH2I *myhist = (TH2I);h1-DrawCopy(title);
      myhist-SetTitle(title);
   }
 
   TCanvas *c2 = new TCanvas("c2", "Violin Presets", 800, 300);
   c2-Divide(2, 1);
 
   for (int i = 1; i < 3; i++) {
      c2-cd(i);
      title = TString.Format("VIOLINX%d", i);
      TH2I *myhist = (TH2I);h1-DrawCopy(title);
      myhist-SetFillColor(kGray + 2);
   }
 
   TCanvas *c3 = new TCanvas("c3", "Playing with candle and violin-options", 800, 600);
   c3-Divide(3, 2);
   TString myopt = {"1000000", "2000000", "3000000", "1112111", "112111", "112111"};
   for (int i = 0; i < 6; i++) {
      c3-cd(i + 1);
      title = TString.Format("candlex(%s)", myopt[i].Data());
      TH2I *myhist = (TH2I);h1-DrawCopy(title);
      myhist-SetFillColor(kYellow);
      if (i == 4) {
         TH2I *myhist2 = (TH2I);h1-DrawCopy("candlex(1000000) same");
         myhist2-SetFillColor(kRed);
      }
      if (i == 5) {
         myhist-SetBarWidth(0.2);
         myhist-SetBarOffset(0.25);
         TH2I *myhist2 = (TH2I);h1-DrawCopy("candlex(2000000) same");
         myhist2-SetFillColor(kRed);
         myhist2-SetBarWidth(0.6);
         myhist2-SetBarOffset(-0.5);
      }
      myhist-SetTitle(title);
   }
}
