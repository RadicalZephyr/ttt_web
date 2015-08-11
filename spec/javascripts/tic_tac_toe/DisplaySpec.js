describe("Display", function() {
    var div;
    var display;

    beforeEach(function() {
        div = {};
        display = new Display(div);
    });

    it("can be hidden", function() {
        var cl = {"add": function() {}};
        var div = {"classList": cl};
        display = new Display(div);
        spyOn(cl, "add");

        display.hide();
        expect(cl.add).toHaveBeenCalledWith("hidden");
    });

    it("can be shown", function() {
        var cl = {"remove": function() {}};
        var div = {"classList": cl};
        display = new Display(div);
        spyOn(cl, "remove");

        display.show();
        expect(cl.remove).toHaveBeenCalledWith("hidden");
    });
});
