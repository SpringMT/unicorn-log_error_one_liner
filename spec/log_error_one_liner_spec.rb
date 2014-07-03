require File.dirname(__FILE__) + '/spec_helper'

describe Unicorn do
  let(:log_dir) { "#{File.dirname(__FILE__)}/log" }
  let(:log_file) { "unicorn.log" }
  let(:logger) {  Logger.new("#{log_dir}/#{log_file}") }

  before do
    Dir.mkdir(log_dir)
  end

  after do
    FileUtils.rm_rf log_dir
  end

  describe '.log_error' do
    context 'valid' do
      before do
        begin
          raise ArgumentError
        rescue => e
          Unicorn.log_error(logger, "hoge", e)
        end
      end
      it do
        expect(File.read("#{log_dir}/#{log_file}").count("\n")).to eq 2
      end
    end
  end
end
