import("stdfaust.lib");

revecho(N, d, a) = _ <: R(N,0) :> _
    with {
        R(0,m) = echo(d * m, 0);
        R(n,m) = echo(d*m, a^n), R(n-1, m+1);
        echo(d,a) = @(d) :*(a);
    };
process = button("play") : pm.djembe(60, 0.3, 0.4, 1) : revecho(8, ma.SR/10, 0.7);