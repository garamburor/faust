import("stdfaust.lib");
am = carrier * modulator
with{
    carrier = os.osc(carFreq);
    modulator = ((1 - modDepth) + (os.osc(modFreq)*0.5 + 0.5)*modDepth);
    modFreq = hslider("Modulator Frequecy", 20, 0.1, 2000, 0.01);
    carFreq = hslider("Carrier Frequency", 440, 50, 2000, 0.01);
    modDepth = hslider("Modulator Depth", 0.5, 0, 1, 0.01);
};


process = am;