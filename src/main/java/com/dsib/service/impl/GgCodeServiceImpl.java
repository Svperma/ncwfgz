package com.dsib.service.impl;

import com.dsib.dao.GgCodeMapper;
import com.dsib.entity.GgCode;
import com.dsib.service.GgCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "ggCodeService")
public class GgCodeServiceImpl implements GgCodeService {

    @Autowired
    private GgCodeMapper ggCodeMapper;

    @Override
    public List<GgCode> getCodeTypes(String code) {
        return ggCodeMapper.getGgCode(code);
    }

    @Override
    public GgCode getProvince(String typeCode, String provinceCode) {
        return ggCodeMapper.getProvince(typeCode, provinceCode);
    }


    @Override
    public List<GgCode> getCitys(String typeCode, String provinceCode) {
        return ggCodeMapper.getCity(typeCode, provinceCode);
    }

	@Override
	public List<GgCode> getGgCodeByObj(GgCode code) {
		List<GgCode> list = ggCodeMapper.getGgCodeByObj(code);
		return list;
	}
}
