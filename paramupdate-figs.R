# code for beta-binom update figure

library(luck)
library(tikzDevice)

# test of tikzDevice
tikz("tikzdevice/test.tex", width = 6.5, height = 3.5, bareBones = TRUE)
#tikz("simpleEx.tex", width = 3.5, height = 3.5, standAlone = TRUE)
par(mfrow=c(1,2))
plot(1, main = '\\footnotesize Hello World!')
par(cex.main=1)
plot(1, main = "Hello World!")
par(mfrow=c(1,1))
dev.off()


# update of single point
noninfsg <- LuckModel(n0 = 2, y0 = 0.5, LuckModelData(n = 16, tau = 12)) 
noninfln <- LuckModel(n0 = 2, y0 = c(0,1), LuckModelData(n = 16, tau = 12)) 
xlims <- c(-2, 19) # c(4, 25)

tikz("tikzdevice/noninfsg1.tex", width = 3.5, height = 4, bareBones = TRUE)
par(mar = c(4,5,5,0) + rep(0.1,4))
plot(noninfsg, control = controlList(annotate = FALSE), xlim = xlims, ylim = c(0,1))
#title(xlab = expression("$\\nzg$ resp. $\\nng$"))
title(xlab = "$n^{(0)}$ resp. $n^{(n)}$")
title(ylab = "$y^{(0)}$ resp. $y^{(n)}$")
points(n0(noninfsg)[1], y0(noninfsg)[1], pch = 19)
dev.off()

tikz("tikzdevice/noninfsg2.tex", width = 3.5, height = 4, bareBones = TRUE)
par(mar = c(4,5,5,0) + rep(0.1,4))
plot(noninfsg, control = controlList(annotate = FALSE), xlim = xlims, ylim = c(0,1))
plot(noninfsg, control = controlList(annotate = FALSE, posterior = TRUE), add = TRUE)
#title(xlab = expression("$\\nzg$ resp. $\\nng$"))
title(xlab = "$n^{(0)}$ resp. $n^{(n)}$")
title(ylab = "$y^{(0)}$ resp. $y^{(n)}$")
points(n0(noninfsg)[1], y0(noninfsg)[1], pch = 19)
points(updateLuckN(n0(noninfsg)[1], n(data(noninfsg))),
       updateLuckY(n0(noninfsg)[1], y0(noninfsg)[1], tau(data(noninfsg)), n(data(noninfsg))), pch = 19)
dev.off()

tikz("tikzdevice/noninfln1.tex", width = 3.5, height = 4, bareBones = TRUE)
par(mar = c(4,5,5,0) + rep(0.1,4))
plot(noninfsg, control = controlList(annotate = FALSE), xlim = xlims, ylim = c(0,1))
plot(noninfsg, control = controlList(annotate = FALSE, posterior = TRUE), add = TRUE)
#title(xlab = expression("$\\nzg$ resp. $\\nng$"))
title(xlab = "$n^{(0)}$ resp. $n^{(n)}$")
title(ylab = "$y^{(0)}$ resp. $y^{(n)}$")
points(n0(noninfsg)[1], y0(noninfsg)[1], pch = 19, col = "gray")
points(updateLuckN(n0(noninfsg)[1], n(data(noninfsg))),
       updateLuckY(n0(noninfsg)[1], y0(noninfsg)[1], tau(data(noninfsg)), n(data(noninfsg))), pch = 19, col = "gray")
plot(noninfln, control = controlList(annotate = FALSE), add = TRUE, lwd = 2.2)
dev.off()

tikz("tikzdevice/noninfln2.tex", width = 3.5, height = 4, bareBones = TRUE)
par(mar = c(4,5,5,0) + rep(0.1,4))
plot(noninfsg, control = controlList(annotate = FALSE), xlim = xlims, ylim = c(0,1))
plot(noninfsg, control = controlList(annotate = FALSE, posterior = TRUE), add = TRUE)
#title(xlab = expression("$\\nzg$ resp. $\\nng$"))
title(xlab = "$n^{(0)}$ resp. $n^{(n)}$")
title(ylab = "$y^{(0)}$ resp. $y^{(n)}$")
points(n0(noninfsg)[1], y0(noninfsg)[1], pch = 19, col = "gray")
points(updateLuckN(n0(noninfsg)[1], n(data(noninfsg))),
       updateLuckY(n0(noninfsg)[1], y0(noninfsg)[1], tau(data(noninfsg)), n(data(noninfsg))), pch = 19, col = "gray")
plot(noninfln, control = controlList(annotate = FALSE), add = TRUE, lwd = 2.2)
plot(noninfln, control = controlList(annotate = FALSE, posterior = TRUE), add = TRUE, lwd = 2.2)
dev.off()

updateLuckY(n0(noninfsg)[1], y0(noninfsg)[1], tau(data(noninfsg)), n(data(noninfsg)))
updateLuckY(n0(noninfln)[1], y0(noninfln)[1], tau(data(noninfln)), n(data(noninfln)))
updateLuckY(n0(noninfln)[1], y0(noninfln)[2], tau(data(noninfln)), n(data(noninfln)))

#