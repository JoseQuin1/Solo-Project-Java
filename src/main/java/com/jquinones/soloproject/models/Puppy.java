package com.jquinones.soloproject.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Puppy {
	

	public static Object puppies() {
		
		List<Object> objList = new ArrayList<>();
		Map<String, Object> map1 = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		Map<String, Object> map3 = new HashMap<>();
		Map<String, Object> map4 = new HashMap<>();
		Map<String, Object> map5 = new HashMap<>();
		Map<String, Object> map6 = new HashMap<>();
		Map<String, Object> map7 = new HashMap<>();
		Map<String, Object> map8 = new HashMap<>();
		Map<String, Object> map9 = new HashMap<>();

		
		for (int i = 1; i < 8; i++) {
			switch (i) {
			case 1:
				map1.put("id", 1);
				map1.put("name", "Sput");
				map1.put("age", "7 weeks");
				map1.put("type", "Great Dane");
				objList.add(map1);
			case 2:
				map2.put("id", 2);
				map2.put("name", "Ziggy");
				map2.put("age", "12 weeks");
				map2.put("type", "Corgi");
				objList.add(map2);
			case 3:
				map3.put("id", 3);
				map3.put("name", "Bell");
				map3.put("age", "9 weeks");
				map3.put("type", "Golden Retriever");
				objList.add(map3);
			case 4:
				map4.put("id", 4);
				map4.put("name", "Mike");
				map4.put("age", "11 weeks");
				map4.put("type", "Labrador Retriever");
				objList.add(map4);
			case 5:
				map5.put("id", 5);
				map5.put("name", "Maze");
				map5.put("age", "8 weeks");
				map5.put("type", "Jack Rusell Terrier");
				objList.add(map5);
			case 6:
				map6.put("id", 6);
				map6.put("name", "Mel");
				map6.put("age", "7 weeks");
				map6.put("type", "Husky");
				objList.add(map6);
			case 7:
				map7.put("id", 7);
				map7.put("name", "Chester");
				map7.put("age", "11 weeks");
				map7.put("type", "Pointer");
				objList.add(map7);
			case 8:
				map8.put("id", 8);
				map8.put("name", "Kenzi");
				map8.put("age", "15 weeks");
				map8.put("type", "German Shepherd");
				objList.add(map8);
			case 9:
				map9.put("id", 9);
				map9.put("name", "Herbie");
				map9.put("age", "11 weeks");
				map9.put("type", "Cavalier King Charles Spaniel");
				objList.add(map9);
			}
		}

		return objList;
	}

}