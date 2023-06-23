<div class="gshop-sidebar bg-white rounded-2 overflow-hidden">
    <!--Filter by Categories-->
    <div class="sidebar-widget category-widget bg-white py-5 px-4 border-top mobile-menu-wrapper scrollbar h-400px">
        <div class="widget-title d-flex">
            <h6 class="mb-0 flex-shrink-0">{{ localize('Occasions') }}</h6>
            <span class="hr-line w-100 position-relative d-block align-self-end ms-1"></span>
        </div>
        <ul class="widget-nav mt-4">

            @php
                $product_listing_categories = getSetting('product_listing_categories') != null ? json_decode(getSetting('product_listing_categories')) : [];
                $categories = \App\Models\Category::whereIn('id', $product_listing_categories)->get();
            @endphp
            @foreach ($categories as $category)
                @php
                    $productsCount = \App\Models\ProductCategory::where('category_id', $category->id)->count();
                @endphp
                <li><a href="{{ route('products.index') }}?&category_id={{ $category->id }}"
                        class="d-flex justify-content-between align-items-center">{{ $category->collectLocalization('name') }}<span
                            class="fw-bold fs-xs total-count">{{ $productsCount }}</span></a></li>
            @endforeach

        </ul>
    </div>
    <!--Filter by Categories-->
</div>
