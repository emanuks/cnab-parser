require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/blocks', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Block. As you add validations to Block, be sure to
  # adjust the attributes here as well.

  let!(:user) { users(:test) }
  before { sign_in(user) }

  let(:valid_attributes) do
    {
      name: 'Valid Name',
      cnab: Rack::Test::UploadedFile.new('CNAB.txt'),
      user:
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      cnab: Rack::Test::UploadedFile.new('CNAB.txt'),
      user:
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Block.create! valid_attributes
      get blocks_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      block = Block.create! valid_attributes
      get block_url(block)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_block_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      block = Block.create! valid_attributes
      get edit_block_url(block)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Block' do
        expect do
          post blocks_url, params: { block: valid_attributes }
        end.to change(Block, :count).by(1)
      end

      it 'redirects to the created block' do
        post blocks_url, params: { block: valid_attributes }
        expect(response).to redirect_to(block_url(Block.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Block' do
        expect do
          post blocks_url, params: { block: invalid_attributes }
        end.to change(Block, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post blocks_url, params: { block: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested block' do
      block = Block.create! valid_attributes
      expect do
        delete block_url(block)
      end.to change(Block, :count).by(-1)
    end

    it 'redirects to the blocks list' do
      block = Block.create! valid_attributes
      delete block_url(block)
      expect(response).to redirect_to(root_path)
    end
  end
end
