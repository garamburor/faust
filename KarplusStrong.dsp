import("stdfaust.lib");

string = vgroup("Karplus Strong", +~(@(delLength-1) : *(damp)))
with{
    freq = hslider("[0]Frequency", 440, 50, 5000, 1);
    damp = hslider("[1]Damping", 0.99, 0, 1, 0.01);
    filter = _ <: _,_' :> /(2); // To dampen HF faster
    delLength = ma.SR / freq;
};

pluck = hgroup("[[1] Pluck", gate : ba.impulsify*gain)
with{
    gain = hslider("Gain", 1, 0, 1, 0.01);
    gate = button("gate");
};

process = pluck : string;
