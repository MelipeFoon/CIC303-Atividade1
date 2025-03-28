package atv1;

public class Relop extends Token {
    public final Tag op;

    public Relop(Tag op) {
        super(Tag.RELOP);
        this.op = op;
    }

    @Override
    public String toString() {
        return "RELOP: <" + this.tag + ",\"" + this.op + "\">";
    }
}