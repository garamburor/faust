import("stdfaust.lib");

fComb = vgroup("Feedback Comb Filter", +~(de.fdelay4(maxDelay,delLength) : *(feedback)))
with{
    maxDelay = 10;
    freq = hslider("Frequency", 1, 0.1, 10, 0.01);
    feedback = hslider("Feedback", 0, 0, 1, 0.01);
    delLength = (maxDelay-1)*(os.osc(freq)*0.5 + 0.5);
};

process = 0.3 * no.noise : fComb;