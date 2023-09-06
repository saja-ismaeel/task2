import { useState } from "react";

export default function Scoreboard() {
  const [player, setPlayer] = useState({
    firstName: "Ranjani",
    lastName: "Shettar",
    score: 10,
  });

  function handlePlusClick() {
    // We can't  directly mutate the state object.
    // We should create a new object and update it.
    setPlayer({
      ...player,
      score: player.score + 1, // Correct way to increment the score by 1
    });
  }

  function handleFirstNameChange(e) {
    // When updating the state based on the previous state,
    // We should use the functional form of setState to ensure proper updates.
    setPlayer((prevState) => ({
      ...prevState,
      firstName: e.target.value,
    }));
  }

  function handleLastNameChange(e) {
    // Include the 'score' property when updating the state.
    setPlayer((prevState) => ({
      ...prevState,
      lastName: e.target.value,
    }));
  }

  return (
    <>
      <label>
        Score: <b>{player.score}</b>{" "}
        <button onClick={handlePlusClick}>+1</button>
      </label>
      <label>
        First name:
        <input value={player.firstName} onChange={handleFirstNameChange} />
      </label>
      <label>
        Last name:
        <input value={player.lastName} onChange={handleLastNameChange} />
      </label>
    </>
  );
}
