require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)  #do not forget to establish file product_factory.rb in folder factories
    @admin = FactoryBot.create(:admin)
  end

      context 'GET #index' do
        it 'should success and renders the index template' do
          get :index
          expect(response).to be_ok
          expect(response).to render_template('index')
        end
      end


      context 'GET #show' do
        it 'should success and render single product' do
         get :show, params: { id: @product.id }
         expect(response).to be_ok
         expect(response).to render_template('show')
        end
      end


      context 'GET #new while user' do
        before do
          sign_in @user
        end
        it 'does NOT rendering the product new page' do
          get :new, params: { id: @product.id }
          expect(response).to redirect_to '/'
        end
      end


      context 'GET #new while admin' do
        before do
          sign_in @admin
        end
        it 'rendering the product new page' do
          get :new, params: { id: @product.id }
          expect(response).to be_ok
          expect(response).to render_template('new')
        end
      end


      context 'POST #create when not admin' do
      before do
        sign_in @user
      end
      it 'cannot create new product' do
        expect{
           post :create, params: { product:  FactoryBot.attributes_for(:product) }
         }.to change(Product,:count).by(0)
      end
    end


    context 'POST #create when admin' do
    before do
      sign_in @admin
    end
    it 'can create new product' do
      expect{
         post :create, params: { product:  FactoryBot.attributes_for(:product) }
           }.to change(Product,:count).by(1)
      end
    end


    context 'DELETE #destroy when admin' do
     before do
       sign_in @admin
     end
    it 'should delete product' do
       expect { delete :destroy, params: { id: @product.id } }.to change(Product, :count).by(-1)
       expect(flash[:notice]).to eq 'Product was successfully destroyed.'
      end
     end


    context 'PUT #update when admin' do
      before do
        sign_in @admin
      end
     it 'should update product' do
       params = {
        name: 'TestBike',
        price: 450
       }
       put :update, params: { id: @product.id, product: params }
       @product.reload
       params.keys.each do |key|
        expect(@product.attributes[key.to_s]).to eq params[key]
       end
      end



end
end
