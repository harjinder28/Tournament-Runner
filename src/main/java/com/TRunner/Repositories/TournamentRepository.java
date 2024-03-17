package com.TRunner.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.TRunner.Entities.Tournament;

@Repository
public interface TournamentRepository extends JpaRepository<Tournament, Integer> {

}
