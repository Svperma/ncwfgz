package com.dsib.service;


import com.dsib.entity.GgCode;

import java.util.List;

public interface GgCodeService {
    List<GgCode> getCodeTypes(String code);

    GgCode getProvince(String typeCode, String provinceCode);

    List<GgCode> getCitys(String typeCode, String provinceCode);

    List<GgCode> getGgCodeByObj(GgCode code);
}
