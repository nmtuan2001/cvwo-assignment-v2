require 'rails_helper'

RSpec.describe "Projects", type: :request do
  # initialize test data
  let!(:projects) { create_list(:project, 10) }
  let(:project_id) { project.first.id }

  describe 'GET /project' do
    before { get '/project' }

    it 'returns project' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /project/:id' do
    before { get "/project/#{project_id}" }

    context 'when the record exists' do
      it 'returns the project' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(project_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:project_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end
  end

  describe 'POST /project' do
    let(:valid_attributes) { { title: 'Project 1', created_by: 'User' } }

    context 'when the request is valid' do
      before { post '/project', params: valid_attributes }

      it 'creates a project' do
        expect(json['title']).to eq('Project 1')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/project', params: { title: 'Error' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Note can't be blank/)
      end
    end
  end

  describe 'PUT /project/:id' do
    let(:valid_attributes) { { title: 'Project Name' } }

    context 'when the record exists' do
      before { put "/project/#{project_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /project/:id' do
    before { delete "/project/#{project_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
