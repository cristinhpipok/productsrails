class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save

    cat = [
           "Books",
           "Toys",
           "Home"

    ]

    params.keys.each do |param|
      if cat.include?(param)
       @product.categories.push(Category.find_by(name: param))
      end
    end

    redirect_to products_path
  end


 def edit
   @product = Product.find(params[:id])





   # product.categories.delete(Category.find_by(name: ""))
 end

 def update
   @product = Product.find(params[:id])
   @product.update(product_params)

cat = [
           "Books",
           "Toys",
           "Home"

    ]
    @product.categories.delete_all

    params.keys.each do |param|
      if cat.include?(param)
       @product.categories.push(Category.find_by(name: params))
      end
    end

   redirect_to products_path
 end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end

end
