define(
    function () {
        if (typeof String.prototype.trim !== 'function') {
            String.prototype.trim = function () {
                return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
            };
        }
    }
);
