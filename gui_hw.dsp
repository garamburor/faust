import("stdfaust.lib");
bas = vslider("Bass[style:knob]", -6, -70, 12, 0.1);
mid = vslider("Mid[style:knob]", -6, -70, 12, 0.1);
tre = vslider("Treble[style:knob]", -6, -70, 12, 0.1);
lvl = vslider("Gain", -24, -70, 12, 0.1);
mtr = vbargraph("Level[scale:log]", -70, 12);
process = hgroup("voice",vgroup("EQ",bas,mid,tre),lvl,mtr);