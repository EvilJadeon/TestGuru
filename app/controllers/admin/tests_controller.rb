# frozen_string_literal: true

  class Admin::TestsController < Admin::BaseController
    before_action :find_test, only: %i[show edit update destroy]

    def index
      @tests = Test.all
    end

    def show
      @test
    end

    def new
      @test = Test.new
    end

    def create
      @test = current_user.having_tests.new(test_params)

      if @test.save
        redirect_to admin_tests_path, success: t('.success')
      else
        render :new
      end
    end

    def edit; end

    def update
      if @test.update(test_params)
        redirect_to admin_tests_path, success: t('.update_success')
      else
        render :edit
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_path, notice: t('.delete')
    end

    private

    def find_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id)
    end
  end
