import("stdfaust.lib");

envelope = hgroup("[1]Envelope", en.adsr(attack, decay, sustain, release, gate) * gain)
with { 
    attack = hslider("[0]Attack[style:knob]", 50, 1, 1000, 1) * 0.001;
    decay = hslider("[1]Decay[style:knob]", 50, 1, 1000, 1) * 0.001;
    sustain = hslider("[2]Sustain[style:knob]", 0.8, 0.01, 1, 1);
    release = hslider("[3]Release[style:knob]", 50, 1, 1000, 1) * 0.001;
    gate = button("[4]Gate");
    gain = hslider("[5]Gain[style:knob]", 0.2, 0, 1, 0.01);
};

waveGen = os.osc(freq), os.triangle(freq), os.square(freq), os.sawtooth(freq) : ba.selectn(4, wave)
with {
    wave = nentry("[0]Waveform", 0, 0, 3, 1);
    freq = hslider("[1]freq", 440, 50, 2000, 0.01);
};

process = vgroup("Synth", waveGen * envelope);