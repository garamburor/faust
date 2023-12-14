import("stdfaust.lib");

nStrings = 4;
root = 60;
chordMaj = root, root + 3, root + 7, root + 10;
strum = hslider("Strum", -1, -1, 3, 1);

// Karplus-Strong
string(strum) = hgroup("String[0]",+~(de.fdelay4(maxDelLength,delLength-1) : dispersionFilter : *(damping)))
with{
  damping = hslider("[1]Damping[style:knob]",0.99,0,1,0.01);
  maxDelLength = 1024;
  dispersionFilter = _ <: _,_' :> /(2);
  delLength = ma.SR/ba.midikey2hz(chordMaj : ba.selectn(nStrings, strum));
};

harp(strum) = par(i,nStrings, strum : ba.impulsify : string(strum) ) :> _;

process = vgroup("Harp", strum <: harp);