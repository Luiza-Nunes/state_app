# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SiteController, type: :controller do
  describe '#index' do
    before(:each) do
      get :index
    end

    it 'Return var @states with all states name' do
      expect(assigns(:states)).to eq(['Paraná', 'Santa Catarina', 'Rio Grande do Sul'])
    end
    it 'Return status 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe '#search' do
    context 'When state is Paraná' do
      context 'when searching with down case' do
        before(:each) do
          get :search, params: { city: 'ba', state: 'Paraná' }
        end

        it 'Return var @cities with cities found' do
          expect(assigns(:cities).count).to eq(1)
          expect(assigns(:cities).first.name).to eq('Curitiba')
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when searching with uper case' do
        before(:each) do
          get :search, params: { city: 'NHA', state: 'Paraná' }
        end

        it 'Return var @cities with cities found' do
          expect(assigns(:cities).count).to eq(1)
          expect(assigns(:cities).first.name).to eq('São José dos Pinhais')
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when searching without city' do
        before(:each) do
          get :search, params: { city: '', state: 'Paraná' }
        end

        it 'Return var @cities with all cities of the state' do
          expect(assigns(:cities).count).to eq(4)
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
    context 'When state is Santa Catarina' do
      context 'when searching with down case' do
        before(:each) do
          get :search, params: { city: 'flo', state: 'Santa Catarina' }
        end

        it 'Return var @cities with cities found' do
          expect(assigns(:cities).count).to eq(1)
          expect(assigns(:cities).first.name).to eq('Florianópolis')
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when searching with uper case' do
        before(:each) do
          get :search, params: { city: 'JO', state: 'Santa Catarina' }
        end

        it 'Return var @cities with cities found' do
          expect(assigns(:cities).count).to eq(1)
          expect(assigns(:cities).first.name).to eq('Joinville')
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when searching without city' do
        before(:each) do
          get :search, params: { city: '', state: 'Santa Catarina' }
        end

        it 'Return var @cities with all cities of the state' do
          expect(assigns(:cities).count).to eq(4)
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
    context 'When state is Rio Grande do Sul' do
      context 'when searching with down case' do
        before(:each) do
          get :search, params: { city: 'gra', state: 'Rio Grande do Sul' }
        end

        it 'Return var @cities with cities found' do
          expect(assigns(:cities).count).to eq(1)
          expect(assigns(:cities).first.name).to eq('Gramado')
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when searching with uper case' do
        before(:each) do
          get :search, params: { city: 'BAN', state: 'Rio Grande do Sul' }
        end

        it 'Return var @cities with cities found' do
          expect(assigns(:cities).count).to eq(1)
          expect(assigns(:cities).first.name).to eq('Erebango')
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when searching without city' do
        before(:each) do
          get :search, params: { city: '', state: 'Rio Grande do Sul' }
        end

        it 'Return var @cities with all cities of the state' do
          expect(assigns(:cities).count).to eq(4)
        end
        it 'Render view search' do
          expect(response).to render_template('site/search')
        end
        it 'Return status 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
