package com.codingdojo.doctors.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.doctors.models.Post;


@Repository
public interface PostRepository extends CrudRepository<Post, Long> {

	List<Post> findAll();
}
