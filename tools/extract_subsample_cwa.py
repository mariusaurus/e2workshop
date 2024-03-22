import zarr
import numpy as np
import cftime
import datetime

def convert_datetime_to_cftime(
    time: datetime.datetime, cls=cftime.DatetimeGregorian
) -> cftime.DatetimeGregorian:
    """Convert a Python datetime object to a cftime DatetimeGregorian object."""
    return cls(time.year, time.month, time.day, time.hour, time.minute, time.second)


def extract_zarr_subsample(in_path: str,
                           out_path: str,
                           store_times: list) -> None:
    # initialise data sets
    in_group = zarr.open_consolidated(in_path)
    store = zarr.DirectoryStore(out_path)
    out_group = zarr.group(store=store, overwrite=True)

    # determine time indices to extract
    time_format = "%Y-%m-%dT%H:%M:%S"
    store_times = [convert_datetime_to_cftime(datetime.datetime.strptime(time, time_format))
                   for time in store_times]
    all_times = cftime.num2date(in_group["time"], units=in_group["time"].attrs["units"]).tolist()
    time_idcs = [all_times.index(t) for t in store_times]

    # copy time steps and static data to new set
    for name, arr in in_group.arrays():
        if name == 'XTIME':
            continue
        dat = arr
        if arr.shape[0] == len(in_group['time']):
            dat = arr[time_idcs]
        out_group.array(name=name, data=dat, chunks=arr.chunks)

        # set attributes
        for key, val in arr.attrs.items():
            out_group[name].attrs[key] = val

    # assert all times are valid
    assert np.all(np.all(out_group['era5_valid'][:], axis=-1) & out_group['cwb_valid'][:] != 0)

    # consolidate meta data
    out_group = zarr.convenience.consolidate_metadata(store)


if __name__ == "__main__":
    in_path = '/e2ws_data/cwa_data/2023-01-24-cwb-4years.zarr'
    out_path = '/one_day_data/2021-09-12-cwb-1day.zarr'
    store_times = [f'2021-09-12T{nn:02d}:00:00' for nn in range(24)]

    extract_zarr_subsample(in_path, out_path, store_times)
