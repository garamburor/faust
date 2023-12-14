import("stdfaust.lib");

echo = vgroup("Echo", +~(@(delLength) : *(feedback)))
with{
    duration = hslider("Duration", 500, 1, 1000, 1)*0.001;
    feedback = hslider("Feedback", 0.5, 0, 1, 0.01);
    delLength = ma.SR * duration;
};

process = echo;