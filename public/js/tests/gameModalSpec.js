describe('gameModal', () => {
  describe('function availablity', () => {
    it('should find fetchModal', () => {
      expect(fetchModal).toBeDefined();
    })
    it('should find buildModal', () => {
      expect(buildModal).toBeDefined();
    })
  })
  describe('buildModal', () => {
    let game;

    beforeEach(()=> {
      $('#modalContainer').html('<div></div>')
      game = {"id":55,"name":"Asteroids","year":1979,"publisher":"Atari","description":"Atari's most successful coin-operated game.","image":"http://localhost:3000/system/games/images/000/000/055/original/Asteroids.jpg?1502409127"};
    })
    
    it('should return a known output for a known input', () => {
      buildModal(game);
      expect(JSON.stringify($('#modalContainer').text())).toContain('Asteroids')
    })

    it('should cause a change in the modal container', () => {
      const before = JSON.stringify($('#modalContainer').text());
      buildModal(game);
      const after = JSON.stringify($('#modalContainer').text());
      expect(before).not.toEqual(after);
    })
  })
})