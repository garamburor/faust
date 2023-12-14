import("stdfaust.lib");

// Create operator
operator(mod) = vgroup("Operator", oscillator * envelope)
with {
    gain = hslider("[0]Gain[style:knob]",0.8,0,1,0.01);
    freq = hslider("[1]Freq[style:knob]",500,20,1000,0.1);
    index = hslider("[2]Index[style:knob]",0,-100,100,0.1);
    oscillator = hgroup("[0]Oscillator", os.osc(freq + index*mod) * gain);
    envelope = hgroup("[1]Envelope ",en.adsr(attack,decay,sustain,release))
    with {
        attack = hslider("[0]Attack[style:knob]",50,1,1000,1)*0.001;
        decay = hslider("[1]Decay[style:knob]",50,1,1000,1)*0.001;
        sustain = hslider("[2]Sustain[style:knob]",0.8,0.01,1,0.01);
        release = hslider("[3]Release[style:knob]",50,1,1000,1)*0.001;
    };
};

// Create patch
op3 = operator(0);
op2 = operator(op3);
op1 = operator(op2);

// I dont understand why the need for a peak eq but ok
process = hgroup("DX7", op1) : fi.peak_eq(3, 1000, 200);