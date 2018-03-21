package com.dsib.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-mybatis.xml")
public class GgBuildingmstMapperTest {

    @Autowired
    private GgBuildingmstMapper ggBuildingmstMapper;

    @Test
    public void retrieveGgBuildingMst() throws Exception {
        int i = ggBuildingmstMapper.retrieveGgBuildingMst("3209001197507048962");
        System.out.println(i);

    }

    @Test
    public void getGgBuildingmstCount() {
        Map<String, Object> map = new HashMap<>();
        map.put("province", "520000");
        map.put("city", "520100");
        Map<String, String> resault = ggBuildingmstMapper.getGgBuildingmstCount(map);

        Set<Map.Entry<String, String>> entries = resault.entrySet();
        for(Map.Entry<String, String> m : entries) {
            System.out.println(m);
        }

    }
}