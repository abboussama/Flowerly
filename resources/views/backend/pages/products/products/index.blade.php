@extends('backend.layouts.master')

@section('title')
    {{ localize('Bouquets') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="tt-section pt-4">
        <div class="container">
            <div class="row mb-3">
                <div class="col-12">
                    <div class="card tt-page-header">
                        <div class="card-body d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title">
                                <h2 class="h5 mb-lg-0">{{ localize('Bouquets') }}</h2>
                            </div>
                            <div class="tt-action">
                                @can('add_products')
                                    <a href="{{ route('admin.products.create') }}" class="btn btn-primary"><i
                                            data-feather="plus"></i> {{ localize('Add Bouquet') }}</a>
                                @endcan
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-12">
                    <div class="card mb-4" id="section-1">

                        <table class="table tt-footable border-top" data-use-parent-width="true">
                            <thead>
                                <tr>
                                    <th class="text-center">{{ localize('ID') }}
                                    </th>
                                    <th>{{ localize('Bouquet Name') }}</th>
                                    {{-- <th data-breakpoints="xs sm">{{ localize('Brand') }}</th> --}}
                                    <th data-breakpoints="xs sm">{{ localize('Occasions') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Price') }}</th>
                                    {{-- <th data-breakpoints="xs sm md">{{ localize('Published') }}</th> --}}
                                    <th data-breakpoints="xs sm md" class="text-end">{{ localize('Action') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($products as $key => $product)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 + ($products->currentPage() - 1) * $products->perPage() }}</td>
                                        <td>
                                            <a href="{{ route('products.show', $product->slug) }}"
                                                class="d-flex align-items-center" target="_blank">
                                                <div class="avatar avatar-sm">
                                                    <img class="rounded-circle"
                                                        src="{{ uploadedAsset($product->thumbnail_image) }}" alt=""
                                                        onerror="this.onerror=null;this.src='{{ staticAsset('backend/assets/img/placeholder-thumb.png') }}';" />
                                                </div>
                                                <h6 class="fs-sm mb-0 ms-2">{{ $product->collectLocalization('name') }}
                                                </h6>
                                            </a>
                                        </td>
                                        {{-- <td>
                                            <span
                                                class="fs-sm">{{ optional($product->brand)->collectLocalization('name') }}</span>
                                        </td> --}}
                                        <td>
                                            @forelse ($product->categories as $category)
                                                <span
                                                    class="badge rounded-pill bg-secondary">{{ $category->collectLocalization('name') }}</span>

                                            @empty
                                                <span class="badge rounded-pill bg-secondary">{{ localize('N/A') }}</span>
                                            @endforelse
                                        </td>
                                        <td>
                                            <div class="tt-tb-price fs-sm fw-bold">
                                                <span class="text-accent">
                                                    @if ($product->max_price != $product->min_price)
                                                        {{ formatPrice($product->min_price) }}
                                                        -
                                                        {{ formatPrice($product->max_price) }}
                                                    @else
                                                        {{ formatPrice($product->min_price) }}
                                                    @endif
                                                </span>
                                            </div>
                                        </td>
                                        {{-- <td>
                                            @can('publish_products')
                                                <div class="form-check form-switch">
                                                    <input type="checkbox" onchange="updatePublishedStatus(this)"
                                                        class="form-check-input"
                                                        @if ($product->is_published) checked @endif
                                                        value="{{ $product->id }}">
                                                </div>
                                            @endcan

                                        </td> --}}
                                        <td class="text-end">
                                            <div class="dropdown tt-tb-dropdown">
                                                <button type="button" class="btn p-0" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <i data-feather="more-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end shadow">
                                                    @can('edit_products')
                                                        <a class="dropdown-item"
                                                            href="{{ route('admin.products.edit', ['id' => $product->id, 'lang_key' => env('DEFAULT_LANGUAGE')]) }}&localize">
                                                            <i data-feather="edit-3" class="me-2"></i>{{ localize('Edit') }}
                                                        </a>
                                                    @endcan

                                                    <a class="dropdown-item"
                                                        href="{{ route('products.show', $product->slug) }}"
                                                        target="_blank">
                                                        <i data-feather="eye"
                                                            class="me-2"></i>{{ localize('View Details') }}
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <!--pagination start-->
                        <div class="d-flex align-items-center justify-content-between px-4 pb-4">
                            <span>{{ localize('Showing') }}
                                {{ $products->firstItem() }}-{{ $products->lastItem() }} {{ localize('of') }}
                                {{ $products->total() }} {{ localize('results') }}</span>
                            <nav>
                                {{ $products->appends(request()->input())->links() }}
                            </nav>
                        </div>
                        <!--pagination end-->
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    <script>
        "use strict"

        // update feature status
        function updateFeatureStatus(el) {
            if (el.checked) {
                var status = 1;
            } else {
                var status = 0;
            }
            $.post('{{ route('admin.products.updateFeatureStatus') }}', {
                    _token: '{{ csrf_token() }}',
                    id: el.value,
                    status: status
                },
                function(data) {
                    if (data == 1) {
                        notifyMe('success', '{{ localize('Status updated successfully') }}');
                    } else {
                        notifyMe('danger', '{{ localize('Something went wrong') }}');
                    }
                });
        }

        // update publish status 
        function updatePublishedStatus(el) {
            if (el.checked) {
                var status = 1;
            } else {
                var status = 0;
            }
            $.post('{{ route('admin.products.updatePublishedStatus') }}', {
                    _token: '{{ csrf_token() }}',
                    id: el.value,
                    status: status
                },
                function(data) {
                    if (data == 1) {
                        notifyMe('success', '{{ localize('Status updated successfully') }}');
                    } else {
                        notifyMe('danger', '{{ localize('Something went wrong') }}');
                    }
                });
        }
    </script>
@endsection
