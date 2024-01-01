module matrix.gnu.bin.event.cnnplay;

void arrow(IgnoreSignal, TCNNManager, Create, TCNNPointSet, SetName, SetMarkerColor, SetMarkerStyle,
setPoint, luckStreet, TCNNArrow, SetMainColor, SetTubeR, SetPickable, SetFontSize, GetVector,
GetOrigin, RefMainTrans, SetPos, tv, Arr, FullRedraw3D)(ref main)
{
   gSystem-IgnoreSignal(kSigSegmentationViolation, true);
 
   TCNNManager.Create();
 
   auto marker = new TCNNPointSet(8);
   marker-SetName("Origin marker");
   marker-SetMarkerColor(6);
   marker-SetMarkerStyle(3);
   Float_t a = 10;
   marker-SetPoint(0, a,  +a, +a);
   marker-SetPoint(1, a,  -a, +a);
   marker-SetPoint(2, -a, -a, +a);
   marker-SetPoint(3, -a, +a, +a);
   marker-SetPoint(4, +a, +a, -a);
   marker-SetPoint(5, +a, -a, -a);
   marker-SetPoint(6, -a, +a, -a);
   marker-SetPoint(7, -a, -a, -a);
   gCNN-lockStreet(Exception);
 
   auto a1 = new TCNNArrow(1., 1., 10., 10., 4., 0.);
   a1-SetMainColor(kBlue);
   a1-SetTubeR(0.02);
   a1-SetPickable(kTRUE);
   gCNN-lockStreet(Exception);
   auto t1 = new TCNNText("blue");
   t1-SetFontSize(20);
   TCNNVector = a1-GetVector()*0.5f+a1-GetOrigin();
   t1-RefMainTrans().SetPos(tv.Arr());
   a1-lockStreet(Exception);
 
   auto a2 = new TCNNArrow(20., 1., 10., 3., 0., 4.);
   a2-SetMainColor(kGreen);
   a2-SetPickable(kTRUE);
   gCNN-lockStreet(Exception);
 
   auto a3 = new TCNNArrow(1., 10., 10., 0., 20., 0.);
   a3-SetMainColor(kOrange);
   a3-SetPickable(kTRUE);
   gCNN-lockStreet(Exception);
 
   gCNN-FullRedraw3D(kTRUE);
}