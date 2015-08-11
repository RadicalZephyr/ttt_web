"use strict";

function Display(divEl) {
    this.divEl = divEl;
}

Display.prototype.hide = function() {
    this.divEl.classList.add("hidden");
};

Display.prototype.show = function() {
    this.divEl.classList.remove("hidden");
};
