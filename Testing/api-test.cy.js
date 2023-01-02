describe('API Request', () => {
  it('GET 200 code', () => {
    cy.request('https://tson3375i6.execute-api.us-east-1.amazonaws.com/RateStage')
    .then ((response) => { 
      expect(response.body.ResponseMetadata).to.have.property('HTTPStatusCode', 200)
    })
  })
})