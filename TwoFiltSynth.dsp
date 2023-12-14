import("stdfaust.lib");
waveGenerator = hgroup("[0]Wave Generator",no.noise,os.triangle(freq),os.square(freq),os.sawtooth(freq) : ba.selectn(4,wave))
with{
  wave = nentry("[0]Waveform",3,0,3,1);
  freq = hslider("[1]freq",440,50,2000,0.01);
};

LFO(freq) = os.osc(freq);

filters = hgroup("[1]Filters", seq(i,2,someFilter(i)))
with{
  someFilter(i) = hgroup("[i]Filter %i", fi.peak_eq(gain,a,c(i)))
  with{
    freq = hslider("[1]Filter %i Freq[style:knob]",1000,100,20000,1);
    gain = hslider("[0]Filter %i Gain[style:knob]",0,-20,20,0.01);
    lfoDepth = hslider("[2]LFO %i Depth[style:knob]",50,0,100,0.1)/100;
    lfoFreq = hslider("[3]LFO %i Freq[style:knob]",5,1,15,0.1);
    a = freq + LFO(lfoFreq)*lfoDepth*99;
    c(0) = 1000;
    c(1) = 1000;
  };
};

envelope = hgroup("[2]Envelope",en.adsr(attack,decay,sustain,release,gate)*gain*0.3)
with{
  attack = hslider("[0]Attack[style:knob]",50,1,1000,1)*0.001;
  decay = hslider("[1]Decay[style:knob]",50,1,1000,1)*0.001;
  sustain = hslider("[2]Sustain[style:knob]",0.8,0.01,1,0.001);
  release = hslider("[3]Release[style:knob]",50,1,1000,1)*0.001;
  gain = hslider("[4]gain[style:knob]",1,0,1,0.01);
  gate = button("[5]gate");
};

subtractive = (waveGenerator : filters)*envelope;
process = vgroup("Subtractive Synthesizer",subtractive);