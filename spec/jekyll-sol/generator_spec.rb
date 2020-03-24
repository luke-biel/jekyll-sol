# frozen_string_literal: true

require 'spec_helper'
require 'jekyll-sol/generator'

RSpec.describe JekyllSol::Generator do
  context '#connect' do
    let(:target) { described_class.new }

    subject { target.connect }

    before(:each) do
      allow(File).to receive(:exist?).and_return true
    end

    it 'connects to database' do
      expect(Pluto).to receive(:connect).with(adapter: 'sqlite3', database: './planet.db')

      subject
    end
  end

  # context '#generate' do
  #   let(:target) { described_class.new }
  #   let(:site)   { instance_double(Jekyll::Site) }

  #   subject { target.generate(site) }

  #   before(:each) do
  #     allow(target).to receive(:db_file).and_return('spec/data/sample.db')
  #   end

  #   it 'reads the db' do
  #     subject
  #   end
  # end
end
