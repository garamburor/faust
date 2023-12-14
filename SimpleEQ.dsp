declare name "equalizer";
import("stdfaust.lib");

peakeq(f) = hgroup("band %f", fi.peak_eq_cq(level, f, Q)
    with {
        level = vslider("level[unit:dB][style:knob]", 0, -70, 12, 1);
        Q = vslider("Q[style:knob]", 1, 1, 100, 0.01);
    } );

process = no.noise : hgroup("Equalizer", seq(i, 5, peakeq(500+500*i)));
