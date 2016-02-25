void AddColor(Int_t color, Double_t r, Double_t g, Double_t b, TString name) {
  (void)new TColor(color,r,g,b);
}

void jc2_style() {
  gROOT->SetStyle("Plain");
  gStyle->SetPaperSize(TStyle::kUSLetter);
  gStyle->SetPaperSize(18,22);
  gStyle->SetOptFit(1111);
  gStyle->SetPalette(1);
  gStyle->SetNdivisions(505);

  gStyle->SetCanvasColor(0);
  gStyle->SetPadTopMargin(.075);
  gStyle->SetPadLeftMargin(.15);
  gStyle->SetPadRightMargin(.1);
  //gStyle->SetPadBottomMargin(.15);
  gStyle->SetTitleYOffset(1.5);
  gStyle->SetLabelFont(42,"X");
  gStyle->SetLabelFont(42,"Y");

  // prepare gStyle to be useful
  //   1 = solid
  //   2 = long dash (30 10)
  //   3 = dotted (4 8)
  //   4 = dash-dot (15 12 4 12)
  //   5 = short dash ( 15 15 )
  //   6 = dash-dot-dot 
  gStyle->SetLineStyleString(1,"[]");
  gStyle->SetLineStyleString(2,"[30 10]");
  gStyle->SetLineStyleString(3,"[4 8]");
  gStyle->SetLineStyleString(4,"[15 12 4 12]");
  gStyle->SetLineStyleString(5,"[15 15]");
  gStyle->SetLineStyleString(6,"[15 12 4 12 4 12]");
  gStyle->SetLabelSize(0.045,"X");
  gStyle->SetLabelSize(0.045,"Y");
  gStyle->SetNdivisions(505,"Y");
  gStyle->SetOptDate(0);
  gStyle->SetDateY(.98);
  gStyle->SetStripDecimals(kFALSE);

  gStyle->SetHistLineColor(kBlue+2);

  gStyle->SetTitleBorderSize(0);
  //gStyle->SetTitleSize(0.050,"");
  gStyle->SetTitleAlign(23);
  gStyle->SetTitleX(0.5);
  gStyle->SetTitleY(1.0);
  gStyle->SetTitleFillColor(0);


  // Add the colors I like
  AddColor(1756, 52./255.,164./255.,237./255.,"Some blue");
  AddColor(1757, 203./255.,31./255.,31./255.,"Some red");
  AddColor(1758, 212./255.,115./255.,212./255.,"Deep mauve");
  AddColor(1759, 141./255.,182./255.,0./255.,"Apple green");
  AddColor(1760, 61./255.,43./255.,31./255.,"Briste (brown)");
  AddColor(1761, 191./255.,255./255.,0./255.,"Lime (green)");
  AddColor(1762, 237./255.,135./255.,45./255.,"Cadmium Orange");
}
