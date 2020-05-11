var canvas = document.getElementById('canvas');
if (canvas = getContext) {
    var ctx = canvas.getContext('2d');

    ctx.beginPath();

    // x(t) = (R+r)*cos((r/R)*t) - a*cos((1+r/R)*t)
    // y(t) = (R+r)*sin((r/R)*t) - a*sin((1+r/R)*t)

    var R = 8, r = 1, a = 4;
    var x0 = R + r - a, y0 = 0;
    ctx.moveTo(150 + 10 * x0, 150 + 10 * y0);

    var cos = Math.cos, sin = Math.sin, pi = Math.PI, nRev = 16;
    for(var t = 0.0; t < pi * nRev; t += 0.01) {
        var x = (R+r) * cos((r/R)*t) - a*cos((1+r/R)*t);
        var y = (R+r) * sin((r/R)*t) - a*sin((1+r/R)*t);
        ctx.lineTo(150 + 10 * x, 150 + 10 * y);
        //document.write(x+", "+y);
    }
    ctx.stroke();
}