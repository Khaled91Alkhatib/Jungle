describe('Home Page', () => {

  beforeEach(() => {
    cy.visit("/");
  })

  it("Should add product to cart and show count change of cart button", () => {
    cy.get("article div .btn").first().click({ force: true });
    cy.get("nav .nav-item").contains("My Cart (1)");
  });
})