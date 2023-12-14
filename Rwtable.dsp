import("stdfaust.lib");

looper = rwtable(tableSize, 0.0, recIndex,_,readIndex)
with {
    record = button("[2]Record") : int;
    readSpeed = hslider("[0]Read Speed", 1, 0.001, 10, 0.01);
    tableSize = 48000;
    recIndex = (+(1) : %(tableSize)) ~ *(record);
    readIndex = readSpeed/float(ma.SR) : (+ : ma.decimal) ~ _ : *(float(tableSize)) : int;
};

polyLooper = vgroup("Looper",_ <: par(i,nVoices,looper(detune*i)) :> _,_)
with{
    nVoices = 10;
    detune = hslider("Detune", 0.01, 0, 1, 0.01)
};
process = looper : dm.zita_light;