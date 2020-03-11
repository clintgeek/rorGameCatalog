describe('tableBuilder', () => {
  describe('function availablity', () => {
    it('should find loadTable', () => {
      expect(loadTable).toBeDefined();
    })

    it('should find CreateTableFromJSON', () => {
      expect(CreateTableFromJSON).toBeDefined();
    })
  })
  describe('tableBuilder', () => {
    let gamesJSON;
    
    beforeEach(()=> {
      $('#gamesData').html('<div></div>')
      gamesJSON = [
        {
          "id": 91,
          "name": "Space Invaders",
          "year": 1978,
          "publisher": "Taito (Japan) / Midway (U.S.)"
        },
        {
          "id": 55,
          "name": "Asteroids",
          "year": 1979,
          "publisher": "Atari"
        }
      ]
    })
    
    it('should return a known output for a known input', () => {
      CreateTableFromJSON(gamesJSON);
      expect(JSON.stringify($('#gamesData').text())).toContain('Space Invaders')
      expect(JSON.stringify($('#gamesData').text())).toContain('Asteroids')
    })

    it('should cause a change in the gamesData container', () => {
      const before = $('#gamesData').text();
      CreateTableFromJSON(gamesJSON);
      const after = $('#gamesData').text(); 
      expect(before).not.toEqual(after);
    })
  })
})