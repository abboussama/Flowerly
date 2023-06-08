<div class="gshop-sidebar bg-white rounded-2 overflow-hidden">
    <!--Filter by search-->
    <div class="sidebar-widget search-widget bg-white py-5 px-4">
        <div class="widget-title d-flex">
            <h6 class="mb-0 flex-shrink-0">{{ localize('Search Now') }}</h6>
            <span class="hr-line w-100 position-relative d-block align-self-end ms-1"></span>
        </div>
        <div class="search-form d-flex align-items-center mt-4">
            <input type="hidden" name="view" value="{{ request()->view }}">
            <input type="text" id="search" name="search"
                @isset($searchKey)
       value="{{ $searchKey }}"
       @endisset
                placeholder="{{ localize('Search') }}">
            <button type="submit" class="submit-icon-btn-secondary"><i
                    class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </div>
    <!--Filter by search-->
    <!--Filter by Categories-->
    <div class="sidebar-widget category-widget bg-white py-5 px-4 border-top mobile-menu-wrapper scrollbar h-400px">
        <div class="widget-title d-flex">
            <h6 class="mb-0 flex-shrink-0">{{ localize('Categories') }}</h6>
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
