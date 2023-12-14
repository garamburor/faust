import("stdfaust.lib");
waveGen = hgroup("[0]Wave Generator", no.noise, os.triangle(freq), os.square(freq), os.sawtooth(freq) : ba.selectn(4, wave))
with {
    wave = nentry("[0]Waveform", 3, 0, 3, 1);
    freq = hslider("[1]Frequency[style:knob]", 440, 50, 2000, 0.01);
};

subtractive = waveGen : hgroup("[1]Filter", fi.resonlp(resFreq,q,1))
with { 
    ctFreq = hslider("[0]Cutoff Frequency[style:knob]", 2000, 50, 10000, 0.1);
    q = hslider("[1]Q[style:knob]", 5, 1, 30, 0.1);
    lfoFreq = hslider("[2]LFO Frequency[style:knob]", 10, 0.1, 20, 0.01);
    lfoDepth = hslider("[3]LFO Depth[style:knob]", 500, 1, 10000, 1);
    resFreq = ctFreq + os.osc(lfoFreq) * lfoDepth : max(30);
};

process = subtractive;