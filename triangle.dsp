  import("stdfaust.lib");
  phase(f) = f/ma.SR : (+,1:fmod) ~ _;
  triangle(f) = abs(phase(f) - 0.5) - 0.25;
  process = triangle(hslider("freq", 440, 40, 8000, 1));