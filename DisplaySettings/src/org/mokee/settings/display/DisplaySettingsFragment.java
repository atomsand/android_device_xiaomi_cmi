/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.mokee.settings.display;

import android.os.Bundle;
import android.provider.Settings;
import androidx.preference.PreferenceFragment;
import androidx.preference.Preference;
import androidx.preference.ListPreference;

import org.mokee.settings.R;

public class DisplaySettingsFragment extends PreferenceFragment {

    private static final String REFRESHRATE_KEY = "refreshrate";

    private ListPreference mRefreshRate;

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.display_settings);
        mRefreshRate = (ListPreference) findPreference(REFRESHRATE_KEY);
        mRefreshRate.setOnPreferenceChangeListener(RefreshRateListener);
        updateValuesAndSummaries();
    }

    private void updateValuesAndSummaries() {
        final float refreshRate = Settings.System.getFloat(getContext().getContentResolver(),
            Settings.System.MIN_REFRESH_RATE, 90.0f);
        mRefreshRate.setValue(((int) refreshRate) + " Hz");
        mRefreshRate.setSummary(mRefreshRate.getValue());
    }

    private Preference.OnPreferenceChangeListener RefreshRateListener =
        new Preference.OnPreferenceChangeListener() {
            @Override
            public boolean onPreferenceChange(Preference preference, Object value) {
                final String key = preference.getKey();

                if (REFRESHRATE_KEY.equals(key)) {
                    Settings.System.putFloat(getContext().getContentResolver(),
                        Settings.System.MIN_REFRESH_RATE,
                        (float) Integer.parseInt((String) value));
                }

                updateValuesAndSummaries();
                return true;
            }
        };
}
