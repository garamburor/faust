import("stdfaust.lib");

fComb = vgroup("Feedback CombFilter", +~(@(delLength) : *(feedback)))
with{
    delLength = hslider("Delay Length", 1, 1, 100, 1);
    feedback = hslider("Feedback", 0, 0, 1, 0.01);
};

process = 0.3 * no.noise : fComb;