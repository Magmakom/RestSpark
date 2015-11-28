package com.dataart.restaurantsrating.entity;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;

import org.junit.Test;
import com.google.gson.Gson;

public class TestRestaurant {

	@Test
	public void testConstructorAndGson() {
		Restaurant r = new Restaurant(
			"test1",
			"some restaurant",
			"12345678",
			"some description",
			"some address",
			"10:00 - 23:00",
			"15.123455",
			"38.234343",
                        "2",
                        "3",
                        "4"
		);
		
		Gson gson = new Gson();
		String stringified = gson.toJson(r);

		System.out.println(stringified);

		assertThat(stringified, containsString("\"_id\":\"test1\""));
		assertThat(stringified, containsString("\"lng\":\"38.234343\""));
	}
}
