/*global define, navigator*/
define(function () {
    "use strict";
    var Detector = function (agent, pixelratio) {
        this.agent = agent || navigator.userAgent || "";
	this.resolution = pixelratio || window.devicePixelRatio || 1;

    };

    Detector.prototype.isMobile = function () {
        return ((/mobi|mini|blackberry(\d+)|symbian/i).test(this.agent) && !(/ipad/i).test(this.agent));
    };

    Detector.prototype.isRetina = function () {
        return (this.resolution > 1);
    };

    return Detector;
});
