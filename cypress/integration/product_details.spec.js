describe('Home Page', () => {

  beforeEach(() => {
    cy.visit("/");
    cy.get('article')
      .eq(1)
      .click()
  })

  it('should see product details page', () => {
    cy.get("article.product-detail").should("be.visible");
  })

})