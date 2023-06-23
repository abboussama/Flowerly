@extends('backend.layouts.master')

@section('title')
    {{ localize('Add New Occasion') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection


@section('contents')
    <section class="tt-section pt-4">
        <div class="container">
            <div class="row mb-3">
                <div class="col-12">
                    <div class="card tt-page-header">
                        <div class="card-body d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title">
                                <h2 class="h5 mb-lg-0">{{ localize('Add Occasion') }}</h2>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4 g-4">

                <!--left sidebar-->
                <div class="col-xl-9 order-2 order-md-2 order-lg-2 order-xl-1">
                    <form action="{{ route('admin.categories.store') }}" method="POST" class="pb-650">
                        @csrf
                        <!--basic information start-->
                        <div class="card mb-4" id="section-1">
                            <div class="card-body">
                                

                                <div class="mb-4">
                                    <label for="name" class="form-label">{{ localize('Occasion Name') }}</label>
                                    <input class="form-control" type="text" id="name"
                                        placeholder="{{ localize('Type your Occasion name') }}" name="name" required>
                                </div>

                                <div class="mb-4">
                                    <label for="parent_id" class="form-label">{{ localize('Base Occasion') }}</label>
                                    <select class="form-control select2" name="parent_id" class="w-100"
                                        data-toggle="select2">
                                        <option value="0">᎗</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">
                                                {{ $category->collectLocalization('name') }}</option>
                                            @foreach ($category->childrenCategories as $childCategory)
                                                @include('backend.pages.products.categories.subCategory', [
                                                    'subCategory' => $childCategory,
                                                ])
                                            @endforeach
                                        @endforeach
                                    </select>
                                </div>

                                {{-- <div class="mb-4">
                                    <label class="form-label">{{ localize('Brands') }}</label>
                                    <select class="form-control select2" name="brand_ids[]" class="w-100"
                                        data-toggle="select2" data-placeholder="{{ localize('Select brands') }}" multiple>
                                        @foreach ($brands as $brand)
                                            <option value="{{ $brand->id }}">
                                                {{ $brand->collectLocalization('name') }}</option>
                                        @endforeach
                                    </select>
                                </div> --}}

                                {{-- <div class="mb-4">
                                    <label for="sorting_order_level"
                                        class="form-label">{{ localize('Sorting Priority Number') }}</label>
                                    <input class="form-control" type="number" id="sorting_order_level"
                                        placeholder="{{ localize('Type sorting priority number') }}"
                                        name="sorting_order_level">
                                </div> --}}
                            </div>
                        </div>
                        <!--basic information end-->

                        <!-- submit button -->
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-4">
                                    <button class="btn btn-primary" type="submit">
                                        <i data-feather="save" class="me-1"></i> {{ localize('Save Occasion') }}
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- submit button end -->

                    </form>
                </div>

                
            </div>
        </div>
    </section>
@endsection
