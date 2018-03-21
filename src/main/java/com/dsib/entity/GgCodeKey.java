package com.dsib.entity;

public class GgCodeKey {
    private String codetype;

    private String codecode;

    public String getCodetype() {
        return codetype;
    }

    public void setCodetype(String codetype) {
        this.codetype = codetype == null ? null : codetype.trim();
    }

    public String getCodecode() {
        return codecode;
    }

    public void setCodecode(String codecode) {
        this.codecode = codecode == null ? null : codecode.trim();
    }
}